FROM mcr.microsoft.com/dotnet/core/sdk:3.0

WORKDIR /App
COPY . /App

ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]
