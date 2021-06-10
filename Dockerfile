FROM jupyter/datascience-notebook:r-4.0.3


USER root
RUN apt-get update && apt-get install -y \
    libglpk-dev \
	libxml2-dev



RUN R -e "install.packages('data.table', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('compositions', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('plotly', repos = 'http://cran.us.r-project.org')"
RUN pip install plotly
RUN pip install -U kaleido
RUN python3 -m pip install --user --upgrade setuptools wheel
RUN pip install cmcrameri


# Other installations we'll need
RUN R -e "install.packages('ggplot2', repos = 'http://cran.us.r-project.org')"

USER jovyan

EXPOSE 8888


