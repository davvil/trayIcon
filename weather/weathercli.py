import argparse
import re
import sys
import urllib
import xml.dom.minidom
from xml.parsers.expat import ExpatError

from clint.textui import puts, colored


class WeatherDataError(Exception):
    pass

class Weather(object):
    def now(self, query):
        try:
            raw_xml = urllib.urlopen('http://www.google.com/ig/api?weather={0}'.format(urllib.quote_plus(query))).read()
            dom = xml.dom.minidom.parseString(raw_xml)
        except ExpatError:
            raise WeatherDataError("Malformed response from weather service")
        except IOError:
            print >> sys.stderr, "Connection error"
            sys.exit(1)


        current_conditions = self.get_element_from_dom(dom, 'current_conditions')
        temperature = self.get_element_from_dom(current_conditions, 'temp_c')
        condition = self.get_element_from_dom(current_conditions, 'condition')
        icon = self.get_element_from_dom(current_conditions, 'icon')

        #return "It's {0} degrees and {1}".format(temperature.getAttribute('data'), condition.getAttribute('data').lower())
        return (temperature.getAttribute('data'),
                condition.getAttribute('data').lower(),
                icon.getAttribute('data'))

    def get_element_from_dom(self, dom, element_name):
        try:
            return dom.getElementsByTagName(element_name)[0]
        except IndexError:
            raise WeatherDataError("No conditions reported for your search")


def get_temp_color(conditions):
    temp_color_map = [
        (40, 'cyan'),
        (60, 'blue'),
        (80, 'yellow')
    ]
        
    temperature_re = re.compile('(?P<temperature>-?\d+)')
    match = temperature_re.search(conditions)
    if match:
        for color in temp_color_map:
            if int(match.group('temperature')) <= color[0]:
                return color[1]
        return 'red'
    return 'white'
    

def main():
    parser = argparse.ArgumentParser(description="Outputs the weather for a given location query string")
    parser.add_argument('zipcode', metavar='zipcode', help="A postal code to find weather for")

    args = parser.parse_args()
    weather = Weather()
    
    try:
        conditions = weather.now(args.zipcode)
    except WeatherDataError as e:
        print >> sys.stderr, "ERROR: {0}".format(e.message)
        sys.exit(1)

    #puts(getattr(colored, get_temp_color(conditions))(conditions))
    print "%s\t\"%s\"\t%s\n" % (conditions[0], conditions[1], conditions[2])


if __name__ == '__main__':
    main()
