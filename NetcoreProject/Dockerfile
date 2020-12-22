FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app
# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
# copy everything else and build
COPY . ./
# RUN set ASPNETCORE_ENVIRONMENT=Development
# RUN dotnet publish -c Debug -o out # -r NetcoreProject
RUN dotnet publish -c Release -o out


# build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "NetcoreProject.dll"]
