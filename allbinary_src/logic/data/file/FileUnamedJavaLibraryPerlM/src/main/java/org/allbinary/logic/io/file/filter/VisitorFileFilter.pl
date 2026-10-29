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

package org::allbinary::logic::io::file::filter::VisitorFileFilter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::FileFilter';


sub _init_fields {
    my ($self) = @_;
    $self->{booleanVisitorInterface} = undef;
}


sub new {
    my ($class, $booleanVisitorInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{booleanVisitorInterface} = $booleanVisitorInterface;
    return $self;
}


sub accept {
    my ($self, $file) = @_;
        my $abFile = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFile($file);
        my $isFileAcceptable = ($self->{booleanVisitorInterface}->visit($abFile));
        return $isFileAcceptable || $file->isDirectory();
}


# Java overloaded method: Perl keeps the last definition
sub accept {
    my ($self, $file) = @_;
        my $isFileAcceptable = ($self->{booleanVisitorInterface}->visit($file));
        return $isFileAcceptable || $file->isDirectory();
}

use java::io::File;
# use java::io::FileFilter;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::logic::util::visitor::VisitorInterface;

1;

