FROM kalilinux/kali-rolling

RUN apt-get update && apt-get -yu dist-upgrade -y
RUN apt-get install -y python2.7 python2.7-dev python-pip python-docutils git perl nmap sslscan

# This currently fails, so we install golismero manually.
# RUN apt-get install -y golismero
RUN cd /opt && git clone https://github.com/golismero/golismero.git && cd golismero && pip install -r requirements.txt && pip install -r requirements_unix.txt && ln -s /opt./golismero/golismero.py /usr/bin/golismero

RUN apt-get install -y wget
RUN apt-get install -y dmitry
RUN apt-get install -y dnsrecon
RUN apt-get install -y wapiti
RUN apt-get install -y nmap
RUN apt-get install -y sslyze
RUN apt-get install -y dnsenum
RUN apt-get install -y wafw00f
RUN apt-get install -y dirb
RUN apt-get install -y host
RUN apt-get install -y lbd
RUN apt-get install -y xsser
RUN apt-get install -y dnsmap
RUN apt-get install -y dnswalk
RUN apt-get install -y fierce
RUN apt-get install -y davtest
RUN apt-get install -y whatweb
RUN apt-get install -y nikto
RUN apt-get install -y uniscan
RUN apt-get install -y whois
RUN apt-get install -y theharvester

WORKDIR /rapidscan
RUN wget -O rapidscan.py https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py && chmod +x rapidscan.py
RUN ln -s /rapidscan/rapidscan.py /usr/local/bin/rapidscan
WORKDIR /reports
ENTRYPOINT ["rapidscan"]
