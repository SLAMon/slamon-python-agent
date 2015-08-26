FROM python:3.4

# Install dependencies
RUN pip install requests python-dateutil responses

# Install SLAMon Python Agent
RUN mkdir workspace
ADD . /workspace
WORKDIR /workspace
RUN pip install .

CMD ["sh", "-c", "slamon-agent -u ${AFM} -l ${HANDLERS} ${EXTRA_FLAGS}"]
