# Crave
This repository is meant for the Codeology app, Crave. Currently, it contains two folders that help divide the work between the two teams working on the app. The ```Cravebot``` folder is maintained by the frontend team: Jennifer, David, and Howie. The ```backend``` is maintained by the backend team: Tina, Anna, and Marvin. 

## Installing
### Requirements
We don't know what specific minimum version you would need for any of the following software, but the most recent version of any of the below should work.

* Python 3.7
	* [virtualenv](https://packaging.python.org/guides/installing-using-pip-and-virtualenv/) (```pip install virtualenv```)

* ```Requirements.txt```
	* ```certifi==2019.3.9```
	* ```chardet==3.0.4```
	* ```Click==7.0```
	* ```Flask==1.0.2```
	* ```idna==2.8```
	* ```itsdangerous==1.1.0```
	* ```Jinja2==2.10.1```
	* ```MarkupSafe==1.1.1```
	* ```pyspellchecker==0.4.0```
	* ```requests==2.21.0```
	* ```urllib3==1.24.2```
	* ```Werkzeug==0.15.2```
	* ```yelpapi==2.3.0```

### Backend Setup
Note: This is only needed if you do not want to manually install the indicated libraries on your local computer. 

To ensure package version consistency and avoid polluting your global package installations, we highly recommend running the code with ```virtualenv``` (```pip install virtualenv```).

In the highest directory level, there should be a file called ```requirements.txt```. This is created by running [```pip freeze```](https://pip.pypa.io/en/stable/reference/pip_freeze/) and lists all Python packages and versions needed for the virtual environment.

If this is your first time accessing this repository:

1. Create your own local virtual environment by running ```python3 -m venv crave_venv```. This should create a ```crave_venv``` file in your working directory. **Be careful to avoid tracking the ```crave_venv``` file and pushing it to this repo.**
2. Run ```source crave_venv/bin/activate``` to activate the virtual environment. 
3. Run ```crave_venv/bin/pip install -r requirements.txt``` to install the packages
4. To deactivate the environment, run ```deactivate```

If ```requirements.txt``` has been updated, follow from step 2 onward!

If you've set everything up, all you need to do from now own is to run ```source crave_venv/bin/activate``` to activate the virtual environment and run ```deactivate`` to deactivate the virtual environment.

To update ```requirements.txt```, run ```crave_venv/bin/pip freeze > requirements.txt```.

## Testing
### Backend Only
To test custom requests to the backend, download the app [Postmates](https://www.getpostman.com/downloads/) and go the following [support page](https://support.brightcove.com/use-postman-api-requests?fbclid=IwAR01Hh94iz6XgrVNO_O7PVi3jhqw4_i9vsJcUZEubVT0Ffa51sV3fHsv03I). 

1. In the page, go to the **Using Postman** section and follow steps 1-6. There is no need to do the steps beyond that because no authentication is required!
2. Go to the **Send Post Requests** section and follow steps 17-20. An example of the body could be 
```{
	"location": "Berkeley",
	"category": "Pie",
	"price": "100"
}
```
3. Before following Step 21 and clicking **Send**, inside the box that sends Send Request Url, input ```http://localhost:5000/api/backend```
![](https://i.imgur.com/UkgL2xP.png) 
4. Inside your terminal, go to the directory with ```app.py``` and run ```flask run```. Then, click the ```Send button``` inside Postman and you should see the result printed out in the terminal!
