# protein-master-project

## Prerequirement
OS:
``` sh
➜  ~ sw_vers
ProductName:		macOS
ProductVersion:		15.3.2
BuildVersion:		24D81
```

Environment:
``` sh
➜  protein-master-project git:(main) ✗ npm -v      
10.9.2
➜  protein-master-project git:(main) ✗ python --version    
Python 3.12.7
➜  protein-master-project git:(main) ✗ pip --version
pip 24.3.1
➜  ~ pymol --version
PyMOL 3.1.0 Open-Source, 2025-03-03
➜  ~ mkdssp --version
mkdssp version 4.4.10
➜  ~ echo $OPENAI_API_KEY
sk-proj-xxxx # your openai key

```

## Quick Start
```
./build.sh
```

If you find something like this in the terminal, it means the startup is successful.
```
Starting the backend server...
Backend server started with PID=99673
Starting the frontend development server...
Frontend server started with PID=99674
Both servers have been started. Waiting for processes to finish...
```

Then, please visit `http://localhost:3000/` in your browser. You should see a page like this:

![](./images/homepage.png)

For example, you can try ProteinID: 7B3Y. Then you can go to the following page:
![](./images/result_page.png)

## Init Submodules
```
git submodule init
git submodule update
```

## Start Backend & frontend
[Backend](./backend/README.md) <br>
[Frontend](./frontend/README.md)