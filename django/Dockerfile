FROM conda/miniconda3-centos7:latest
MAINTAINER Luminosite

RUN conda create --name dj python=2.7;\
    conda init bash;\
    conda

#    2  conda env list
#    3  python -V
#    4  pwd
#    5  ls
#    6  ls home/
#    7  mkdir home/l
#    8  cd home/l
#    9  conda create --name dj python=2.7
#   10  activate dj
#   11  python -V
#   12  activate dj
#   13  conda activate dj
#   14  conda init bash
#   15  source /root/.bashrc
#   16  conda deactivate
#   17  conda activate dj
#   18  ls
#   19  python -V
#   20  pip install django
#   21  python
#   22  conda deactivate
#   23  conda install -C conda-forge conda-pack
#   24  pip install conda-pack
#   25  conda pack -n dj
#   26  ls
#   27  history


ADD ./tools /opt/product/tools/
ENV JAVA_HOME /opt/product/tools/jdk1.8.0_191
CMD ["/usr/sbin/init"]
