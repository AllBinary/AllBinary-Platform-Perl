# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NO_DESCRIPTION} = "No Description";
    $self->{AUTHENTICATION} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Authentication", $self->{NO_DESCRIPTION});
    $self->{AUTHENTICATIONERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Authentication Error", $self->{NO_DESCRIPTION});
    $self->{CATEGORY} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Category", $self->{NO_DESCRIPTION});
    $self->{CATEGORYERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Category Error", $self->{NO_DESCRIPTION});
    $self->{CRYPT} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Crypt", $self->{NO_DESCRIPTION});
    $self->{CRYPTERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Crypt Error", $self->{NO_DESCRIPTION});
    $self->{EMAILLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Email", $self->{NO_DESCRIPTION});
    $self->{EMAILLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Email Error", $self->{NO_DESCRIPTION});
    $self->{ENTITYFACTORYERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Entity Factory Error", $self->{NO_DESCRIPTION});
    $self->{NETBEANS_MODULE} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("NetBeans Module", $self->{NO_DESCRIPTION});
    $self->{NETBEANS_MODULE_ERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("NetBeans Module Error", $self->{NO_DESCRIPTION});
    $self->{FACTORYERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("General Factory Error", $self->{NO_DESCRIPTION});
    $self->{FILE} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("File", $self->{NO_DESCRIPTION});
    $self->{FILEERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("File Error", $self->{NO_DESCRIPTION});
    $self->{HTTP} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("HTTP", $self->{NO_DESCRIPTION});
    $self->{HTTPERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("HTTP Error", $self->{NO_DESCRIPTION});
    $self->{HTTPREQUEST} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Http Request", $self->{NO_DESCRIPTION});
    $self->{HTTPREQUESTERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Http Request Error", $self->{NO_DESCRIPTION});
    $self->{IDLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("ID Logging", $self->{NO_DESCRIPTION});
    $self->{JSPEXTRAOUTPUT} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("JSP Extra Output", $self->{NO_DESCRIPTION});
    $self->{JSPTAGEXTRAOUTPUT} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("JSP Tag Extra Output", $self->{NO_DESCRIPTION});
    $self->{JSPTAG} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("JSP Tag", $self->{NO_DESCRIPTION});
    $self->{JSPTAGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("JSP Tag Error", $self->{NO_DESCRIPTION});
    $self->{LICENSING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Licensing", $self->{NO_DESCRIPTION});
    $self->{LICENSINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Licensing Error", $self->{NO_DESCRIPTION});
    $self->{LOADER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Loader", $self->{NO_DESCRIPTION});
    $self->{LOADERERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Loader Error", $self->{NO_DESCRIPTION});
    $self->{OS} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("OS", $self->{NO_DESCRIPTION});
    $self->{OSERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("OS Error", $self->{NO_DESCRIPTION});
    $self->{PAYMENT} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Payment", $self->{NO_DESCRIPTION});
    $self->{PAYMENTERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Payment Error", $self->{NO_DESCRIPTION});
    $self->{PRELOADER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("PreLoader", $self->{NO_DESCRIPTION});
    $self->{PRELOADERERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("PreLoader Error", $self->{NO_DESCRIPTION});
    $self->{PRODUCTSEARCHLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Product Search Logging", $self->{NO_DESCRIPTION});
    $self->{PRODUCTSEARCHLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Product Search Logging Error", $self->{NO_DESCRIPTION});
    $self->{SERVLET} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Servlet", $self->{NO_DESCRIPTION});
    $self->{SERVLETERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Servlet Error", $self->{NO_DESCRIPTION});
    $self->{SHIPPINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Shipping Error", $self->{NO_DESCRIPTION});
    $self->{SQLLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Error", $self->{NO_DESCRIPTION});
    $self->{SQLLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Logging", $self->{NO_DESCRIPTION});
    $self->{SQLTAGS} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Tag Logging", $self->{NO_DESCRIPTION});
    $self->{SQLTAGSERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Tag Error", $self->{NO_DESCRIPTION});
    $self->{STYLE} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Style", $self->{NO_DESCRIPTION});
    $self->{STYLEERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Style Error", $self->{NO_DESCRIPTION});
    $self->{TAGHELPER} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tag Helper", $self->{NO_DESCRIPTION});
    $self->{TAGHELPERERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tag Helper Error", $self->{NO_DESCRIPTION});
    $self->{TAGHELPERFACTORY} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tag Helper Factory", $self->{NO_DESCRIPTION});
    $self->{TAGHELPERFACTORYERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tag Helper Factory Error", $self->{NO_DESCRIPTION});
    $self->{TAX} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tax", $self->{NO_DESCRIPTION});
    $self->{TAXERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Tax Error", $self->{NO_DESCRIPTION});
    $self->{VALIDATION} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Validation", $self->{NO_DESCRIPTION});
    $self->{VALIDATIONERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Validation Error", $self->{NO_DESCRIPTION});
    $self->{VIEW} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("View", $self->{NO_DESCRIPTION});
    $self->{VIEWERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("View Error", $self->{NO_DESCRIPTION});
    $self->{VIEWFACTORYERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("View Factory Error", $self->{NO_DESCRIPTION});
    $self->{WORKFLOW} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Workflow", $self->{NO_DESCRIPTION});
    $self->{WORKFLOWERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Workflow Error", $self->{NO_DESCRIPTION});
    $self->{XMLLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("XML Logging", $self->{NO_DESCRIPTION});
    $self->{XMLLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("XML Logging Error", $self->{NO_DESCRIPTION});
    $self->{XSLLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("XSL Logging", $self->{NO_DESCRIPTION});
    $self->{XSLLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("XSL Logging Error", $self->{NO_DESCRIPTION});
    $self->{REPLACE} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Replace", $self->{NO_DESCRIPTION});
    $self->{REPLACE_INFO} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Replace Info", $self->{NO_DESCRIPTION});
    $self->{REPLACEERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Replace Error", $self->{NO_DESCRIPTION});
    $self->{SQLLOGGINGPOOL} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Pool", $self->{NO_DESCRIPTION});
    $self->{SQLLOGGINGPOOLERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("SQL Pool Error", $self->{NO_DESCRIPTION});
    $self->{STATICPAGEGENERATIONLOGGING} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Static Page Generation Logging", $self->{NO_DESCRIPTION});
    $self->{STATICPAGEGENERATIONLOGGINGERROR} = 'org::allbinary::logic::communication::log::config::type::LogConfigType'->new("Static Page Generation Logging Error", $self->{NO_DESCRIPTION});
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::logic::communication::log::PreLogUtil'->put("FreeBlisket", $self, 'org::allbinary::string::CommonStrings'->getInstance()->{CONSTRUCTOR});
    return $self;
}

use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::config::type::LogConfigType;

1;

