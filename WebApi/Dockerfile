# Use the official .NET Core SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code and build the project
COPY . ./
RUN dotnet build --configuration Release --no-restore

# Publish the project
RUN dotnet publish --configuration Release --no-build --output /app/publish

# Use a lightweight .NET Core runtime image as the base image for the final image
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS runtime

# Set the working directory inside the container
WORKDIR /app

# Copy the published output from the build image to the runtime image
COPY --from=build /app/publish .

# Expose the port that your Web API listens on (change it accordingly if needed)
EXPOSE 80

# Start the application
ENTRYPOINT ["dotnet", "WebApi.dll"]