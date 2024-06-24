variable "krillin" {
    description = "Username for springapp mongo db access"
    default = "" #Always makes sure this matches the root user or custom user for the mongo database in the mongo helm chart
}

variable "destructodisk" {
    description = "Password for springapp mongo db access"
    default = "" 
}
