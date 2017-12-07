import sys

def getDayMake(day):
    d = str(day)
    res = "day"+d+" : day"+d+".hs Util.hs\n"
    res += "\tghc --make day"+d+".hs -o day"+d+"\n"
    res += "\tday"+d+".exe day"+d+"_input day"+d+"_input\n"
    res += "\tmake clean\n"
    return res
    
def prettyPrint(f, s):
    f.write(s+"\n")
    
if __name__ == "__main__":
    end = 2
    if len(sys.argv) > 1:
        end = int(sys.argv[1])
        
    with open("Makefile", "w") as f:
        prettyPrint(f, "default : day" + str(end) + "\n")
        prettyPrint(f, "ifndef VERBOSE\n.SILENT:\nendif\n")
        for i in range(1, end+1):
            prettyPrint(f, getDayMake(i))
        prettyPrint(f, "clean :\n\t-rm -f *.hi *.o *.exe\n")