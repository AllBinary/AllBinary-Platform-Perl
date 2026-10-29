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

package taghelpers::ViewHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::TransformInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{componentInterface} = undef;
    $self->{NO_TYPE} = 0;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{componentInterface} = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $hashMap, $pageContext);
    return $self;
}


sub getTypeId {
    my ($self) = @_;
        return $self->{NO_TYPE};
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            return $self->{componentInterface}->view();
        } catch ($e) {
            my $error = "Failed to View: ";
            if (defined($self->{componentInterface})) {
                $error .= ref($self->{componentInterface});
            } else {
                $error .= "Unknown";
            }
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        try {
            die ("Hmm: " . $self->{componentInterface}->getTransformDocumentInterface()->getDoc());
        } catch ($e) {
            my $error = "Failed to View: ";
            if (defined($self->{componentInterface})) {
                $error .= ref($self->{componentInterface});
            } else {
                $error .= "Unknown";
            }
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


sub getViewObject {
    my ($self) = @_;
        return $self->{componentInterface};
}


# throws Exception
sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{componentInterface}->getTransformInfoInterface();
}


sub getTransformDocumentInterface {
    my ($self) = @_;
        return undef;
}


sub setTransformDocumentInterface {
    my ($self, $viewDocumentInterface) = @_;
        return;
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;

1;

