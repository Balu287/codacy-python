FROM python:3.9-alpine
COPY requirements.txt src/codacy_pylint.py src/codacy_pylint_test.py ./
COPY docs /docs
RUN pip3 install --no-cache-dir -r requirements.txt &&\
    adduser -u 2004 -D docker && \
    chown -R docker:docker /docs /home/docker
USER docker
ENTRYPOINT [ "python3" ]
CMD [ "codacy_pylint.py" ]
