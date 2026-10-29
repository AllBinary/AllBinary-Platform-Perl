#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::logic::communication::http::request::AbResponseHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws JspTagException
sub sendJspTagRedirect {
    my ($class, $pageContext, $e) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{JSPTAGERROR})) {
                $logUtil->put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", $e);
            }
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendRedirect($pageContext, 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{ERRORPAGE});
        } catch ($e2) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{LICENSINGERROR})) {
                $logUtil->put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", $e);
            }
            die ("JspTagException");
        }
}


# throws ServletException
sub sendServletRedirect {
    my ($class, $pageContext, $e) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{JSPTAGERROR})) {
                $logUtil->put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", $e);
            }
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendRedirect($pageContext, 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{ERRORPAGE});
        } catch ($e2) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{LICENSINGERROR})) {
                $logUtil->put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", $e);
            }
            die ("ServletException");
        }
}


# throws JspTagException
sub sendJspTagLicensingRedirect {
    my ($class, $pageContext, $e) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{JSPTAGERROR})) {
                $logUtil->put("Licensing Exception", "AbResponseHandler", "sendJspTagLicensingRedirect()", $e);
            }
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendRedirect($pageContext, 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{LICENSEERRORPAGE});
        } catch ($e2) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{LICENSINGERROR})) {
                $logUtil->put("Exception in Redirect Handling", "AbResponseHandler", "sendJspTagLicensingRedirect", $e);
            }
            die ("JspTagException");
        }
}


# throws ServletException
sub sendServletLicensingRedirect {
    my ($class, $pageContext, $e) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{JSPTAGERROR})) {
                $logUtil->put("Licensing Exception", "AbResponseHandler", "sendServletLicensingRedirect()", $e);
            }
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendRedirect($pageContext, 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{LICENSEERRORPAGE});
        } catch ($e2) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{LICENSINGERROR})) {
                $logUtil->put("Exception in Redirect Handling", "AbResponseHandler", "sendServletLicensingRedirect", $e);
            }
            die ("ServletException");
        }
}


# throws Exception
sub sendRedirect {
    my ($class, $pageContext, $page) = @_;
        my $request = $pageContext->getRequest();
        my $response = $pageContext->getResponse();
        my $requestDispatcher = $request->getRequestDispatcher($page);
        if ($response->isCommitted()) {
            $response->sendRedirect($page);
        } else {
            try {
                $requestDispatcher->forward($request, $response);
            } catch ($e) {
                $pageContext->getOut()->print("Error: " . $page);
            }
        }
}

# use javax::servlet::RequestDispatcher;
# use javax::servlet::ServletException;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpServletResponse;
# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::PageContext;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;

1;

