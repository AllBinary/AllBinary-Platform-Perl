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

package bundle::input::automation::ServiceReferenceMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::Map';


sub _init_fields {
    my ($self) = @_;
    $self->{serviceReference} = undef;
}


sub new {
    my ($class, $serviceReference) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{serviceReference} = $serviceReference;
    return $self;
}


sub size {
    my ($self) = @_;
        return -1;
}


sub isEmpty {
    my ($self) = @_;
        return 0;
}


sub containsKey {
    my ($self, $key) = @_;
        return 0;
}


sub containsValue {
    my ($self, $value) = @_;
        return 0;
}


sub get {
    my ($self, $key) = @_;
        return $self->{serviceReference}->getProperty($key);
}


sub put {
    my ($self, $key, $value) = @_;
        return undef;
}


sub remove {
    my ($self, $key) = @_;
        return undef;
}


sub putAll {
    my ($self, $m) = @_;
}


sub clear {
    my ($self) = @_;
}


sub keySet {
    my ($self) = @_;
        my $keyStringArray = $self->{serviceReference}->getPropertyKeys();
        return undef;
}


sub values {
    my ($self) = @_;
        return undef;
}


sub entrySet {
    my ($self) = @_;
        return undef;
}


sub toString {
    my ($class, $map) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        return $stringBuffer->toString();
}

# use java::util::Collection;
# use java::util::Map;
# use java::util::Set;
use org::osgi::framework::ServiceReference;
use org::allbinary::logic::string::StringMaker;

1;

