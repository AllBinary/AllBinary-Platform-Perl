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

package org::allbinary::game::part::MakeCountedPartsSingletonArrayFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::part::MakeCountedPartsSingletonArrayFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::part::MakeCountedPartsSingletonArrayFactory::instance;
}


# throws Exception
sub getUpdated {
    my ($self, $partInterfaceArray) = @_;
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
        for (my $index = 0; $index < scalar(@{$partInterfaceArray}); $index++) {
            $self->{list}->add($partInterfaceArray->[$index]);
        }
        my $countedBasicArrayList = 'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool'->getInstance()->getList();
        my $layerInterfaceFactoryInterface = undef;
        my $size = $countedBasicArrayList->size();
        for (my $index = 0; $index < $size; $index++) {
            $layerInterfaceFactoryInterface = $countedBasicArrayList->{objectArray}->[$index];
            $self->{list}->add('org::allbinary::game::part::CountedLayerInterfaceFactoryPart'->new(0, $layerInterfaceFactoryInterface));
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Total Parts: ");
        $stringBuffer->appendint($self->{list}->size());
        $stringBuffer->append(" Counted: ");
        $stringBuffer->appendint($countedBasicArrayList->size());
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{GET_INSTANCE});
        my $newPartInterfaceArray = [(undef) x ($self->{list}->size())];
        my $newSize = scalar(@{$newPartInterfaceArray});
        for (my $index = 0; $index < $newSize; $index++) {
            $newPartInterfaceArray->[$index] = $self->{list}->get($index);
        }
        return $newPartInterfaceArray;
}

use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::part::CountedLayerInterfaceFactoryPart;

1;

