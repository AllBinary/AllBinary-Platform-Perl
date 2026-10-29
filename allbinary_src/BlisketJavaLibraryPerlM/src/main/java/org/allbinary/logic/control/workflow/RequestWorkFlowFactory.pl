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

package org::allbinary::logic::control::workflow::RequestWorkFlowFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception, LicensingException
sub getInstance {
    my ($class, $request, $response, $servletConfig, $servletContext) = @_;
        my $httpRequest = $request;
        my $requestCommand = $httpRequest->getPathInfo();
        my $index = index($requestCommand, 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $storeName = substr($requestCommand, 0, ($index) - (0));
        my $requestName = substr($requestCommand, $index, (length($requestCommand)) - ($index));
        return 'org::allbinary::data::tables::workflow::WorkFlowEntityFactory'->getInstance()->create2()->get($requestName, $storeName);
}


# throws Exception, LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $hashMap, $pageContext) = @_;
        my $workFlowName = $pageContext->getRequest()->getParameter('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME});
        my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        my $storeName = $weblisketSession->getStoreName();
        return 'org::allbinary::data::tables::workflow::WorkFlowEntityFactory'->getInstance()->create2()->get($workFlowName, $storeName);
}

use java::util::HashMap;
# use javax::servlet::ServletConfig;
# use javax::servlet::ServletContext;
# use javax::servlet::ServletRequest;
# use javax::servlet::ServletResponse;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::data::tables::workflow::WorkFlowEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::control::workflow::WorkFlowData;

1;

