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

package org::allbinary::logic::io::BufferedLineReader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{tmpIn} = undef;
}


sub new {
    my ($class, $file) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{tmpIn} = 'java::io::BufferedReader'->new('java::io::FileReader'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file)));
    return $self;
}


sub readUpToLines {
    my ($self, $readAheadIndex) = @_;
}


# throws Exception
sub readLine {
    my ($self) = @_;
        return $self->{tmpIn}->readLine();
}


# throws Exception
sub ready {
    my ($self) = @_;
        return $self->{tmpIn}->ready();
}


sub getSize {
    my ($self) = @_;
        return 0;
}


sub getCurrent {
    my ($self) = @_;
        return 0;
}

use java::lang::Object ();
# use java::io::BufferedReader ();
# use java::io::FileReader ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::io::file::AbFileNativeUtil ();

1;

