import sys
import os

def convert(filepath):
    out = []
    with open(filepath, 'r', errors='replace') as f:
        lines = f.readlines()
        for line in lines:
            if "\u2006" in line:
                line_new = line.replace("\u2006 \u2006 \u2006 \u2006 ", "\t")
            else:
                line_new = line

            if "#include" in line:
                if "OpenGL.h" in line:
                    line_new = "#include <GL/gl.h>\n"
                if "GLUT.h" in line:
                    line_new = "#include <GL/glut.h>\n"
            out.append(line_new)
        print(out)
    with open(filepath, 'w') as f:
        f.writelines(out)

if __name__=="__main__":
    args = sys.argv[1:]
    l = os.listdir(args[0])

    for i in l:
        if ".h" in i:
            convert(os.path.join(args[0], i))
        else:
            continue
    convert(os.path.join(args[0], args[1]) + '.cpp')