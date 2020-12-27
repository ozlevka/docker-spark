import sys
sys.path.append("/home/vscode/lib")
from pyspark import SparkConf, SparkContext, SparkFiles
import requests
import os



def download_file(url):
    local_name = url.split('/')[-1]
    r = requests.get(url)
    with open(f"/root/{local_name}", mode="wb") as file:
        for chunk in r.iter_content(chunk_size=1024):
            if chunk:
                file.write(chunk)
    return [local_name, os.path.getsize(f"/root/{local_name}")]

conf = SparkConf()
conf.setMaster("spark://spark-master:7077")
conf.setAppName("PythonTest")
conf.set("spark.cores.max", 8)


sc = SparkContext(conf=conf)
#sc.addPyFile("/home/vscode/dev/tests/package.tar.gz")

sites = ["https://data.bloomington.in.gov/dataset/ff8cb100-017d-44ef-a05a-37a19ec44611/resource/521fc11c-c18e-417a-b996-a383854805b4/download/2016-first-quarter-stolen-guns.csv",
         "https://data.bloomington.in.gov/dataset/ff8cb100-017d-44ef-a05a-37a19ec44611/resource/9d253753-2492-46d1-9def-e2473365588f/download/2017-first-quarter-stolen-guns.csv",
         "https://data.bloomington.in.gov/dataset/ff8cb100-017d-44ef-a05a-37a19ec44611/resource/521fc11c-c18e-417a-b996-a383854805b4/download/2016-first-quarter-stolen-guns.csv"]

r = sc.parallelize(sites)

f_names = r.map(lambda x: download_file(x))
print(f_names.collect())



sc.stop()
