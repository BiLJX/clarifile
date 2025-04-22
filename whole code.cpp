#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

int main() {
    DIR *d = opendir("."); 
    struct dirent *f;
    struct stat s;
    char buf[1024];

    while ((f = readdir(d))) {
        if (!strcmp(f->d_name, ".") || !strcmp(f->d_name, "..")) continue;

        stat(f->d_name, &s);
        if (!S_ISREG(s.st_mode)) continue;

        char *ext = strrchr(f->d_name, '.');
        if (!ext) continue;
        ext++;

        if (!strcmp(ext, "mp4") || !strcmp(ext, "jpg")) {
            mkdir(ext, 0755); // don't care if it exists
            snprintf(buf, sizeof(buf), "%s/%s", ext, f->d_name);
            rename(f->d_name, buf);
            printf("moved %s\n", f->d_name);
        }
    }

    closedir(d);
    return 0;
}
