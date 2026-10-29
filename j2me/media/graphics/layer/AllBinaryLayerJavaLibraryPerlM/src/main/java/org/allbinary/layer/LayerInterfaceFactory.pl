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

package org::allbinary::layer::LayerInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::layer::LayerInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{HASHTABLE_LABEL} = "Hashtable: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::layer::LayerInterfaceFactory::SINGLETON;
}


sub init {
    my ($self) = @_;
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


# throws Exception
sub getNexInstance {
    my ($self, $hashtable, $x, $y, $z) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{HASHTABLE_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable))->toString(), $self, $commonStrings->{GET_INSTANCE});
        my $typeInteger = $hashtable->get($org::allbinary::layer::Layer::ID);
        my $layerInterfaceFactoryInterface = $self->{list}->{objectArray}->[int($typeInteger) - 1];
        return $layerInterfaceFactoryInterface->getNextInstance($hashtable, $x, $y, $z);
}


sub add {
    my ($self, $layerInterfaceFactoryInterface) = @_;
        $self->{list}->add($layerInterfaceFactoryInterface);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::layer::Layer;

1;

