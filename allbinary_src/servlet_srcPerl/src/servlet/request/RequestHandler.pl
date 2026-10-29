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

package servlet::request::RequestHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'servlet::request::HttpServlet';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws ServletException
sub init {
    my ($self, $config) = @_;
        $self->SUPER::init($config);
}


sub destroy {
    my ($self) = @_;
}


# throws ServletException, IOException
sub processRequest {
    my ($self, $request, $response) = @_;
        try {
            $response->setContentType("text/html");
            my $out = $response->getWriter();
            my $workflowInterface = 'org::allbinary::logic::control::workflow::RequestWorkFlowFactory'->getInstance($request, $response, $self->getServletConfig(), $self->getServletContext());
            if (defined($workflowInterface)) {
                $out->print($workflowInterface->process());
            }
            $out->flush();
            $out->close();
        } catch ($e) {
            if ($servlet::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($servlet::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SERVLETERROR})) {
                $self->{logUtil}->put("Servlet LicensingException", $self, "processRequest()", $e);
            }
            $response->sendRedirect($self->{abcs}->{globals}->{URLGLOBALS}->{LICENSEERRORPAGE});
        }
}


# throws ServletException, IOException
sub doGet {
    my ($self, $request, $response) = @_;
        $self->processRequest($request, $response);
}


# throws ServletException, IOException
sub doPost {
    my ($self, $request, $response) = @_;
        $self->processRequest($request, $response);
}


sub getServletInfo {
    my ($self) = @_;
        return "WorkFlow Request Handler";
}

# use java::io;
# use java::net;
# use javax::servlet;
# use javax::servlet::http;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::workflow::WorkFlowInterface;
use org::allbinary::logic::control::workflow::RequestWorkFlowFactory;
use servlet::request::HttpServlet;

1;

