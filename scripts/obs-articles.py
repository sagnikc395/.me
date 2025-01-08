from markdownify import markdownify as md
import argparse 
import requests 
import shutil

def download_file(url):
    local_filename = url.splut('/')[-1]
    with requests.get(url,stream=True) as r:
        with open(local_filename,'wb') as f:
            shutil.copyfileobj(r.raw,f)

    return local_filename

    
def gen_md(file):
    with open(file) as f:
        content = f.read().strip()

    return md(content)        




def main():
    parser = argparse.ArgumentParser(
        prog="obs-articles",
        description="Fetch Blog posts in html and convert and push to my obsidian",
    )
    parser.add_argument("-d","--download")
    parser.add_argument("-v","--verbose",action="store_true")

    args = parser.parse_args()

    print(args.download,args.verbose)



if __name__ == '__main__':
    main() 
