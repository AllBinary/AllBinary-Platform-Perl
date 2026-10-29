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

package taghelpers::StoreTagWorkFlowHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{storeWorkFlowInterface} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
            $self->{logUtil}->putF("Properties: " . $hashMap->toString(), $self, "StoreTagWorkFlowHelper()");
        }
        $self->{storeWorkFlowInterface} = 'org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory'->getInstance()->getInstance($self->{abeClientInformation}, $hashMap, $pageContext);
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        try {
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF("Process", $self, $self->{commonStrings}->{PROCESS});
            }
            return $self->{storeWorkFlowInterface}->process();
        } catch ($e) {
            my $error = "Failed to process workflow: ";
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use admin::taghelpers::TagHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory;
use org::allbinary::logic::control::workflow::StoreWorkFlowInterface;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;

1;

