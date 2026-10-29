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

package workflows::template::data::BasicWorkFlow;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::workflow::WorkFlowInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{validationDomNodeInterface} = undef;
    $self->{propertiesHashMap} = undef;
    $self->{pageContext} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{WORKFLOW})) {
            $self->{logUtil}->putF("Properties: " . $propertiesHashMap->toString(), $self, "BasicWorkFlow()");
        }
        $self->{propertiesHashMap} = $propertiesHashMap;
        $self->{pageContext} = $pageContext;
        $self->{validationDomNodeInterface} = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $propertiesHashMap, $pageContext);
    return $self;
}


# throws Exception
sub getName {
    my ($self) = @_;
        return $self->getPropertiesHashMap()->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME});
}


sub getPropertiesHashMap {
    my ($self) = @_;
        return $self->{propertiesHashMap};
}


sub getPageContext {
    my ($self) = @_;
        return $self->{pageContext};
}


# throws Exception
sub process {
    my ($self) = @_;
        if ($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{WORKFLOW})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
        }
        if ($self->{validationDomNodeInterface}->isValid()) {
            $self->{pageContext}->getOut()->print($self->{validationDomNodeInterface}->view());
            return ("" . ($javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE));
        } else {
            $self->{pageContext}->getOut()->print($self->{validationDomNodeInterface}->validationInfo());
            return ("" . ($javax::servlet::jsp::tagext::TagSupport::SKIP_BODY));
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
# use javax::servlet::jsp::tagext::TagSupport;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::control::workflow::WorkFlowData;
use org::allbinary::logic::control::workflow::WorkFlowInterface;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::string::CommonStrings;

1;

