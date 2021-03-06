docker-taiga-events
===================

Taiga Events server packaged in a docker image.

```
Taiga Events server is used together with RabbitMQ to provide live changes reloading in Taiga application.
```

**See also:** [Taiga backend & frontend docker image](https://github.com/riotkit-org/docker-taiga)

*Based on guide from https://taigaio.github.io/taiga-doc/dist/setup-production.html#taiga-events*

#### Running

*Notice: BACKEND_SECRET must match secret configured in Taiga*

```bash
docker run --name taiga_events \
    -e AMQP_URL=amqp://... \
    -e BACKEND_SECRET=... \
    -p 8888:8888 \
    quay.io/riotkit/taiga-events:2de073c1a3883023050597a47582c6a7405914de-SNAPSHOT
```

#### Configuration reference

List of all environment variables that could be used.

```yaml

- AMQP_URL # (default: "")


- BACKEND_SECRET # (default: "")


- RKD_PATH # (default: /opt/rkd/.rkd)


```

Copyleft
--------

Created by **RiotKit Collective**, a libertarian, grassroot, non-profit organization providing technical support for the non-profit Anarchist movement.

Check out those initiatives:
- International Workers Association (https://iwa-ait.org)
- Federacja Anarchistyczna (http://federacja-anarchistyczna.pl)
- Związek Syndykalistów Polski (https://zsp.net.pl) (Polish section of IWA-AIT)
- Komitet Obrony Praw Lokatorów (https://lokatorzy.info.pl)
- Solidarity Federation (https://solfed.org.uk)
- Priama Akcia (https://priamaakcia.sk)
