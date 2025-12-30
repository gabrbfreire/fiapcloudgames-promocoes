FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY FiapCloudGames.Promocoes.sln ./
COPY src/FiapCloudGames.Promocoes.API/FiapCloudGames.Promocoes.API.csproj src/FiapCloudGames.Promocoes.API/
COPY src/FiapCloudGames.Promocoes.Core/FiapCloudGames.Promocoes.Core.csproj src/FiapCloudGames.Promocoes.Core/
COPY src/FiapCloudGames.Promocoes.Infra/FiapCloudGames.Promocoes.Infra.csproj src/FiapCloudGames.Promocoes.Infra/
COPY src/FiapCloudGames.Promocoes.Test/FiapCloudGames.Promocoes.Test.csproj src/FiapCloudGames.Promocoes.Test/

RUN dotnet restore src/FiapCloudGames.Promocoes.API/FiapCloudGames.Promocoes.API.csproj

COPY . .

WORKDIR /src/src/FiapCloudGames.Promocoes.API
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 5002
ENTRYPOINT ["dotnet", "FiapCloudGames.Promocoes.API.dll"]
