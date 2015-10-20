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

def parse_p1( inpStr ):
    outStr = ''
    p1 = re.compile(r'\)\s*ON\s+\[[a-zA-Z]+\]') ##Remove ) ON [PRIMARY] r')'
    if p1.search(inpStr):
       outStr = p1.sub(r')',inpStr)
       return outStr
    else :
       return inpStr

def parse_p2( inpStr ):
    outstr = ''
    p2 = re.compile(r'WITH\s+\([^\)]+\)',re.IGNORECASE) ## remove WITH (PAD_INDEX......)
    if p2.search(inpStr):
       outStr = p2.sub(r'',inpStr)
       return outStr
    else :
       return inpStr
    
def parse_p3( inpStr ):
    outstr = ''
    p3 = re.compile(r'(primary\s+key|unique)\s+(clustered|nonclustered)',re.IGNORECASE) ## Clustered/nonclustered key words r'\1'
    if p3.search(inpStr):
       outStr = p3.sub(r'\1',inpStr)
       return outStr
    else :
       return inpStr

def parse_p4( inpStr ):
    outstr = ''
    p4 = re.compile(r'([a-zA-Z]+\])\s*(ASC|DESC)',re.IGNORECASE) ## remove ASC|DESC in KEY r'\1'
    if p4.search(inpStr):
       outStr = p4.sub(r'\1',inpStr)
       return outStr
    else :
       return inpStr

def parse_p5( inpStr ):
    outstr = ''
    p5 = re.compile(r'collate\s+[a-zA-Z0-9\_]+',re.IGNORECASE) ## remove COLLATE information
    if p5.search(inpStr):
       outStr=p5.sub(r'',inpStr)
       return outStr
    else :
       return inpStr

def parse_p6( inpStr ):
    outstr = ''
    p6 = re.compile(r'\[(datetime|smalldatetime)\]',re.IGNORECASE) #r'timestamp without time zone'
    if p6.search(inpStr):
       outStr = p6.sub(r'timestamp without time zone',inpStr)
       return outStr
    else :
       return inpStr

def parse_p7( inpStr ):
    outstr = ''
    p7 = re.compile(r'\[tinyint\]',re.IGNORECASE)  #r'smallint
    if p7.search(inpStr):
       outStr = p7.sub(r'smallint',inpStr)
       return outStr
    else :
       return inpStr

def parse_p8( inpStr ):
    outstr = ''
    p8 = re.compile(r'\[nvarchar\]',re.IGNORECASE)  #r'varchar
    if p8.search(inpStr):
       outStr = p8.sub(r'varchar',inpStr)
       return outStr
    else :
       return inpStr

def parse_p9( inpStr ):
    outstr = ''
    p9 = re.compile(r'\[varchar\(max\)\]',re.IGNORECASE)  #r'varchar
    if p9.search(inpStr):
       outStr = p9.sub(r'text',inpStr)
       return outStr
    else :
       return inpStr

def parse_p10( inpStr ):
    outstr = ''
    p10 = re.compile(r'\[bit\]',re.IGNORECASE)  #r'boolean
    if p10.search(inpStr):
       outStr = p10.sub(r'boolean',inpStr)
       return outStr
    else :
       return inpStr

def parse_p11( inpStr ):
    outstr = ''
    p11 = re.compile(r'\IDENTITY\(1,1\)',re.IGNORECASE) #r'serial
    if p11.search(inpStr):
       outStr = p11.sub(r'serial',inpStr)
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
	
def main(argv):
    p = optparse.OptionParser(conflict_handler="resolve", description= "This pushes the sql stats to graphite.")
    p.add_option('-f', '--file', action='store', type='string', dest='file', default='D:/postgresql/test.sql', help='The filename you want to read')
    options, arguments = p.parse_args()
    filein = options.file
    fileout = 'D:/postgresql/convert.sql'
    startPrint = False
    endPrint = False
    try :
        fin =  open( filein , 'r' )
        fout = open( fileout , 'w')
        for line in fin.readlines():
            match = re.search(r'create\s+table',line.strip(),re.I)
            endMatch = re.search(r'^GO$',line.strip(),re.I)
            if endMatch:
                endPrint = False
                if startPrint :
                    startPrint = False
                    fout.write( ';\n' )                
            if match:
                startPrint = True
                endPrint = True
                print "startPrint: %s  endPrint: %s" %(startPrint,endPrint)
            if endPrint:
                print "Original string: " + line.strip()
                modString = line
                modString = parse_p1( modString )
                modString = parse_p2( modString )
                modString = parse_p3( modString )
                modString = parse_p4( modString )
                modString = parse_p5( modString )
                modString = parse_p6( modString )
                modString = parse_p7( modString )
                modString = parse_p8( modString )
                modString = parse_p9( modString )
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
