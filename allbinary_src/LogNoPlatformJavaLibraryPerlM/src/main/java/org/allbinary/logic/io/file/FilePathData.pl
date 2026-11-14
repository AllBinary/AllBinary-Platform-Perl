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

package org::allbinary::logic::io::file::FilePathData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::FilePathData'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{SEPARATORCHAR} = $java::io::File::separatorChar;
    $self->{PATH_START} = $java::io::File::separator;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FilePathData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        if ($java::io::File::separatorChar eq "\\") {
            $self->{PATH_START} = $java::io::File::separator . $java::io::File::separator;
        }
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::io::File ();

1;

