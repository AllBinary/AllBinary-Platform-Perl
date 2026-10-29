# Generated Code Do Not Modify

package org::platform::OpenGLResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::platform::OpenGLResources'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::OpenGLResources::instance;
}


sub init {
    my ($self) = @_;
}


sub isExcluded {
    my ($self, $name) = @_;
        die ("RuntimeException");
}


sub getIdentifier {
    my ($self, $name, $defType, $defPackage) = @_;
        die ("RuntimeException");
}


# throws Exception
sub openRawResource {
    my ($self, $id) = @_;
        die ("RuntimeException");
}


# throws Exception
sub openRawResourceFromName {
    my ($self, $resourceName) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getResourceAsStream {
    my ($self, $resourceName) = @_;
        die ("RuntimeException");
}


sub getPackageName {
    my ($self) = @_;
        die ("RuntimeException");
}

# use java::io::InputStream;

1;

