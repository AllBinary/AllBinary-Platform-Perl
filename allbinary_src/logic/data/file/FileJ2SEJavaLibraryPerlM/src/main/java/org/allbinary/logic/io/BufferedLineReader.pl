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


sub _init_fields {
    my ($self) = @_;
    $self->{tmpIn} = undef;
}


sub new {
    my ($class, $file) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
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


sub getSize {
    my ($self) = @_;
        return 0;
}


sub getCurrent {
    my ($self) = @_;
        return 0;
}

# use java::io::BufferedReader;
# use java::io::FileReader;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;

1;

