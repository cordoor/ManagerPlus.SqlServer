FROM mcr.microsoft.com/mssql/server:2019-latest

# Arguments
ARG SA_PASSWORD=Jfkdieu38*
ARG PORT=1433

# Enviornment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=$SA_PASSWORD
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=$PORT

# Setup SqlPackage
WORKDIR /home/mssql
COPY ./sqlpackage .
COPY ./.bashrc .
USER root
RUN chmod a+x ./sqlpackage
USER mssql

# Exposures
EXPOSE $PORT
