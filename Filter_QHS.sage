import snappy

"""
Starting with a list of Haken 3-manifolds from the Hodgson-Weeks census, find all QHS^3 and store them in the file "Haken_QHS3_Data.md"
"""

def read_name(file_name):
  """
  Input: The name of the file containing the list of 3-manifolds from the census
  Output: The list of name of 3-manifolds from the file
  """

  with open(file_name, 'r') as open_file:
    content = open_file.readlines()
  
  return [name[:-1] for name in content]

def is_QHS3(name):
  """
  Input: The name of a 3-manifold from the census. Assume that the 3-manifold is orientable
  Output: True if the first betti number of the manifold is 0 and False otherwise
  """

  M = snappy.Manifold(name)
  if M.homology().betti_number() == 0: 
    return True
  else:
    pass

def write_QHS3(file_name):
  """
  Input: The name of the file containing the list of 3-manifolds from the census. Assume they are all orientable
  Output: The list of names of 3-manifolds from the file_name that are QHS3.
  """
  
  mfld_list = read_name(file_name)
  
  with open("Haken_QHS3_data.txt", "w") as open_file:
    open_file.write("| Name | Volume | Homology | D_inf Quotient | Large SL2C |\n|---|---|---|---|---|\n")

  for name in mfld_list:
    if is_QHS3(name):
      M = snappy.Manifold(name)
      volume = str(M.volume())
      homology = str(M.homology())
      with open("Haken_QHS3_data.txt", "a") as open_file:
        open_file.write("|", name, "|", volume, "|", homology "|", "|","|")
      
  
