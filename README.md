docker 1.9.0, 'copy' not follow symlink

#### docker 1.8.3

```
$ ./run_test.sh 
+ IMAGE_NAME=symlinktest
+ docker images --quiet --all symlinktest
+ xargs -r docker rmi
+ docker build --no-cache -t symlinktest .
Sending build context to Docker daemon 53.25 kB
Step 0 : FROM debian
 ---> bf84c1d84a8f
Step 1 : COPY symlink /opt/
 ---> e7468932d0f8
Removing intermediate container fbe7e5df4259
Successfully built e7468932d0f8
+ docker run --rm symlinktest ls -l /opt
total 4
-rw-r--r-- 1 root root 5 Nov  4 01:00 symlink
```

#### docker 1.9.0

```
$ ./run_test.sh 
+ IMAGE_NAME=symlinktest
+ docker images --quiet --all symlinktest
+ xargs -r docker rmi
+ docker build --no-cache -t symlinktest .
Sending build context to Docker daemon 53.25 kB
Step 1 : FROM debian
 ---> bf84c1d84a8f
Step 2 : COPY symlink /opt/
 ---> f82b84fb6539
Removing intermediate container 66b03c4a7e5e
Successfully built f82b84fb6539
+ docker run --rm symlinktest ls -l /opt
total 4
-rw-r--r-- 1 root root 5 Nov  4 01:00 original
```

