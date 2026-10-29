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

package views::BasicComponentView;
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
    $self->{transformDocumentInterface} = undef;
    $self->{transformInfoInterface} = undef;
    $self->{NO_TYPE} = 0;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($views::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->setTransformInfoInterface($transformInfoInterface);
        $self->setTransformDocumentInterface('org::allbinary::logic::visual::transform::data::TransformDocumentFactory'->getInstance());
    return $self;
}


sub getTypeId {
    my ($self) = @_;
        return $self->{NO_TYPE};
}


sub getTransformDocumentInterface {
    my ($self) = @_;
        return $self->{transformDocumentInterface};
}


sub setTransformDocumentInterface {
    my ($self, $transformDocumentInterface) = @_;
        $self->{transformDocumentInterface} = $transformDocumentInterface;
}


sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


sub setTransformInfoInterface {
    my ($self, $transformInfoInterface) = @_;
        $self->{transformInfoInterface} = $transformInfoInterface;
}


sub toXmlDoc {
    my ($self) = @_;
        return $self->{transformDocumentInterface}->getDoc();
}


# throws Exception
sub getDoc {
    my ($self) = @_;
        my $document = $self->getTransformInfoInterface()->getDataDocument();
        my $dataNode = $self->getTransformDocumentInterface()->getDoc()->importNode($document->getFirstChild(), 1);
        if (defined($dataNode)) {
            $self->getTransformDocumentInterface()->getBaseNode()->appendChild($dataNode);
        }
        return $self->getTransformDocumentInterface()->getDoc();
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->getDoc());
            my $result = 'org::allbinary::logic::visual::transform::BasicTransformer'->new($self->{abeClientInformation}, $self->getTransformInfoInterface())->translate($success);
            return $result;
        } catch ($e) {
            if ($views::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::BasicTransformer;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::data::TransformDocumentFactory;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

