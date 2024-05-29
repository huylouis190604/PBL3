FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["API.API/API.API.csproj", "API.API/"]
RUN dotnet restore "API.API/API.API.csproj"
COPY . .
WORKDIR "/src/API.API"
RUN dotnet build "API.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "API.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "API.API.dll"]
