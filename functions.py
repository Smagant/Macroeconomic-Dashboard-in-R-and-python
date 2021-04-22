import pandas as pd
import numpy as np
import pathlib
import datetime

def valbox(country,code):
    results = []

    path1 = './data/'+country+'.xlsx'
    try:
        #Choose the file if exist 
        df = pd.read_excel(path1)
    except:
        #Delete all the unnecessary files
        for f in pathlib.Path('./data/').iterdir():
            f.unlink()

        #Build the new database
        df = pd.read_excel('./rawdata/data_countries.xlsx')
        df = df[df['Country']==country]
        df.to_excel(path1)

    #Store the condition to find the code of the indicator
    code_index = df['WEO Subject Code']==code
    #=========================================================
    #Find the number
    #=========================================================
    try:
        #Find the last year before estimation
        year = int(df.loc[code_index]['Estimates Start After'].values)
        #Save the previous year into a variable
        yearbefore = year-1
        #Find the number at year
        number = ''.join(df.loc[code_index][year].values)
        #Find the number at yearbefore
        numberbefore = ''.join(df.loc[code_index][yearbefore].values)
        #Save the evolution from the previous year in a variable evol 
        if float(str(number).replace(',', '')) > float(str(numberbefore).replace(',', '')):
            evol = '+'
        elif float(str(number).replace(',', '')) == float(str(numberbefore).replace(',', '')):
            evol = '='
        elif float(str(number).replace(',', '')) < float(str(numberbefore).replace(',', '')):
            evol = '-'
        else:
            evol = 'erreur'
        #Put the number into the list
        results.append(number)
        results.append(evol)
    except:
        results.append('...')
        results.append('')
    
    #=========================================================
    #Find the unit transformed
    #=========================================================
    try:
        # Find the units
        unit = ''.join(df.loc[code_index]['Units'].values)
        #Condition for a unit in percentage
        percent_cond = (
            (unit == 'Percent change') or
            (unit == 'Percent') or
            (unit == 'Percent of GDP') or
            (unit == 'Percent of total labor force') or
            (unit == 'Percent of potential GDP')
        )
        if percent_cond:
            results.append(' %')
        elif unit == 'U.S. dollars':
            results.append(' $')
        elif unit == 'Index':
            results.append('')
        elif unit == 'Persons':
            results.append('')
        else:
            results.append('('+unit+')')
    except:
        results.append('')
    #=========================================================
    #Find the name
    #=========================================================
    try:
        name = ''.join(df.loc[code_index]['Subject Descriptor'].values)
        results.append(name)
    except:
        results.append('')
    #=========================================================
    #Save the unit not transformed
    #=========================================================
    results.append('('+unit+')')
    #=========================================================
    #Find the scale
    #=========================================================
    # Find the units
    try:
        scale = ''.join(df.loc[code_index]['Scale'].values)
        if scale == '':
            results.append('')
        else:
            scale = ''.join(scale)
            results.append('(in '+scale+')')
    
    except:
        results.append('')

    #=========================================================
    #Return the year
    #=========================================================
    try:
        results.append('(year '+str(year)+')')
    except:
        results.append('')
    
    return results
    
#=======================================================================================================

def data_countries():
    #Open the database
    df = pd.read_excel('./rawdata/data_countries.xlsx')
    #Collect of the country names
    country = df.Country.unique()
    return country

#=======================================================================================================
def data_chart(country,code):
    #Search for the file
    path1 = './data/'+country+'.xlsx'
    try:
        #Choose the file if exist 
        df = pd.read_excel(path1)
    except:
        #Delete all the unnecessary files
        for f in pathlib.Path('./data/').iterdir():
            f.unlink()

        #Build the new database
        df = pd.read_excel('./rawdata/data_countries.xlsx')
        df = df[df['Country']==country]
        df.to_excel(path1)

    #Store the condition to find the code of the indicator
    code_index = df['WEO Subject Code']==code

    #Find the last year before estimation
    try:
        year = int(df.loc[code_index]['Estimates Start After'].values)
    except:
        now = datetime.datetime.now()
        year = now.year

    #Collect all the data
    values = []
    years = []
    while year >= 1980:
        years.append(year)
        try:
            value = ''.join(df.loc[code_index][year].values)
            values.append(float(str(value).replace(',', '')))
        except:
            value = df.loc[code_index][year].values
            values.append(np.nan)
        year -= 1
    #Create a dataframe
    df = pd.DataFrame({'years' : years, 'values' : values})
    return df
