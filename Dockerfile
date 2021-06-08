FROM kalilinux/kali-rolling
RUN echo "deb https://http.kali.org/kali kali-rolling main contrib non-free" > ./etc/apt/sources.list
RUN echo "deb http://old.kali.org/kali sana main non-free contrib" >> ./etc/apt/sources.list
RUN apt-get update && apt-get -yu dist-upgrade -y
RUN apt-get install -y python2.7 python2.7-dev python-pip git perl nmap sslscan

# This currently fails, so we install golismero manually. See issue https://github.com/golismero/golismero/issues/59
# RUN apt-get install -y golismero
# This also fails, so we skip completely for now. See issue https://github.com/kislyuk/argcomplete/issues/348
# RUN cd /opt && git clone https://github.com/golismero/golismero.git && cd golismero && pip install -r requirements.txt && ln -s /opt./golismero/golismero.py /usr/bin/golismero

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
