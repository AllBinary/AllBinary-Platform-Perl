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

package org::allbinary::logic::util::cache::IndexedBasicArrayListCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseBasicArrayListCache','org::allbinary::logic::util::cache::CacheInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{size} = 0;
    $self->{index} = 0;
}


# throws Exception
sub createCache {
    my ($class, $size) = @_;
        my $indexedBasicArrayListCache = 'org::allbinary::logic::util::cache::IndexedBasicArrayListCache'->new();
        $indexedBasicArrayListCache->init($size);
        return $indexedBasicArrayListCache;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $size) = @_;
        if ($self->{size} < $size) {
            $self->{list}->ensureCapacity($size);
            for (my $index = $size - 1; $index >= $self->{size}; $index--) {
                $self->addDefault();
            }
            $self->{size} = $size;
        }
}


sub getAt {
    my ($self, $index) = @_;
        return $self->{list}->{objectArray}->[$index];
}


# throws Exception
sub addDefault {
    my ($self) = @_;
}


# throws Exception
sub addObject {
    my ($self, $anyType) = @_;
        $self->{list}->add($anyType);
}


# throws Exception
sub add {
    my ($self, $cacheableInterface) = @_;
        $self->{list}->add($cacheableInterface);
}


# throws Exception
sub addArray {
    my ($self, $cacheableInterfaces) = @_;
        die ("No Imple");
}


sub clear {
    my ($self) = @_;
        $self->{index} = 0;
}

# use jsinterop::annotations::JsType;
use org::allbinary::string::CommonStrings;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::logic::util::cache::BaseBasicArrayListCache;
use org::allbinary::logic::util::cache::CacheInterface;

1;

