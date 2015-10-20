#!/usr/bin/python
import sys
import time
import optparse
import textwrap
import re
import os


#
# thanks to http://stackoverflow.com/a/1229667/72987
#
def optional_arg(arg_default):
    def func(option,opt_str,value,parser):
        if parser.rargs and not parser.rargs[0].startswith('-'):
            val=parser.rargs[0]
            parser.rargs.pop(0)
        else:
            val=arg_default
        setattr(parser.values,option.dest,val)
    return func

def parse_p09( inpStr ):
    outstr = ''
    p9 = re.compile(r'\s*NOT\s+FOR\s+REPLICATION',re.IGNORECASE)  #r'varchar
    if p9.search(inpStr):
       outStr = p9.sub(r'',inpStr)
       return outStr
    else :
       return inpStr

def parse_p10( inpStr ):
    outstr = ''
    p10 = re.compile(r'\s+WITH\s+(CHECK|NOCHECK)',re.IGNORECASE)  #r'boolean
    if p10.search(inpStr):
       outStr = p10.sub(r'',inpStr)
       return outStr
    else :
       return inpStr

def parse_p11( inpStr ):
    outstr = ''
    p11 = re.compile(r'\s+TABLE\s+',re.IGNORECASE) #r'serial
    if p11.search(inpStr):
       outStr = p11.sub(r' TABLE ONLY ',inpStr)
       return outStr
    else :
       return inpStr

def parse_p12( inpStr ):
    outstr = ''
    p12 = re.compile(r'[\[\]]')  ## Remove square brackets
    if p12.search(inpStr):
       outStr = p12.sub(r'',inpStr)
       return outStr
    else :
       return inpStr

def split_string( inpStr ):
    listToken = inpStr.split(' ')
    tName = listToken[2]
    fkey_index = [i for i, j in enumerate(listToken) if j == 'FOREIGN']
    fkeyName = listToken[  fkey_index[0] - 1 ]
    
def main(argv):
    p = optparse.OptionParser(conflict_handler="resolve", description= "This pushes the sql stats to graphite.")
    p.add_option('-f', '--file', action='store', type='string', dest='file', default='D:/postgresql/CruiseBooking_Dev3script.sql', help='The filename you want to read')
    options, arguments = p.parse_args()
    filein = options.file
    fileout = 'D:/postgresql/convert_foreignKey.sql'
    startPrint = False
    endPrint = False
    try :
        fin =  open( filein , 'r' )
        fout = open( fileout , 'w')
        for line in fin.readlines():
            match = re.search(r'alter\s+table',line.strip(),re.I)
            endMatch = re.search(r'^GO$',line.strip(),re.I)
            if endMatch:
                endPrint = False
                if startPrint :
                    startPrint = False
                    fout.write( ';\n' )                
            if match:
                if re.search(r'\s+foreign\s+key',line.strip(),re.I):
                    startPrint = True
                    endPrint = True
                    print "startPrint: %s  endPrint: %s" %(startPrint,endPrint)
            if endPrint:
                print "Original string: " + line.strip()
                modString = line
                modString = parse_p09 ( modString )
                modString = parse_p10 ( modString )
                modString = parse_p11 ( modString )
                modString = parse_p12 ( modString )				
                fout.write(modString.lower())
        fout.close()
        fin.close()
    except IOError as e:
       print "I/O error({0}): {1}".format(e.errno, e.strerror)
    except ValueError:
       print "Could not convert data to an integer."
    except:
       print "Unexpected error:", sys.exc_info()[0]
       raise

#
# main app
#
if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
