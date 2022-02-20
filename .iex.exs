## Aliases
alias Dealcloud.Schema
alias Dealcloud.Data
alias Dealcloud.Management

################################
qa = %Dealcloud.Auth{
  site: "https://qamc2-amclient.dealclouddev.com",
  client_id: "1003660",
  client_secret: "2rgcvCH0KETRHFDx5RjHnDLX1XqJL3hTG7pLVQ-CooY1"
}

prod = %Dealcloud.Auth{
  site: "https://managedservices.dealcloud.com",
  client_id: "8278",
  client_secret: "q61Wkm4XPU3cgt0s8_Zeb4ORqr0ZmIYnyI1-wBOgWVo1"
}

test = [
  %{"entryId" => 1, "fieldId" => 1},
  %{"entryId" => 2, "fieldId" => 2},
  %{"entryId" => 2, "fieldId" => 1},
  %{"entryId" => 1, "fieldId" => 2},
  %{"entryId" => 3, "fieldId" => 1},
  %{"entryId" => 3, "fieldId" => 2}
]
