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

package org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerTypeInterface';

our $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
our $SAVED_CAPTURE = $org::allbinary::input::automation::module::generic::configuration::profile::SavedCaptureGenericProfileDataWorkerType::SAVED_CAPTURE;
our $SCREEN_CAPTURE = 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType'->new("Screen " . $org::allbinary::input::media::image::InputImageType::CAPTURE->getName());
our $COMPARISON = 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType'->new($org::allbinary::input::media::image::InputImageType::COMPARISON->getName());
our $MOTION = 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType'->new($org::allbinary::input::media::image::InputImageType::MOTION->getName());

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::hashMap->put($self->getName(), $self);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerData::NAME, $self->{name});
        return $node;
}


sub toString {
    my ($self) = @_;
        return "GenericProfileDataWorkerType: " . $self->getName();
}


sub getInstance {
    my ($class, $node) = @_;
        my $name = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node);
        return $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::hashMap->get($name);
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::media::image::InputImageType;
use org::allbinary::logic::StdUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerTypeInterface;
use org::allbinary::input::automation::module::generic::configuration::profile::SavedCaptureGenericProfileDataWorkerType;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerData;

1;

