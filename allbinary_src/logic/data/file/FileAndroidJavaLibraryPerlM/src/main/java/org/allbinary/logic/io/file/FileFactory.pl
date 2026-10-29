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

package org::allbinary::logic::io::file::FileFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::io::file::FileFactory'->new('org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext());

sub _init_fields {
    my ($self) = @_;
    $self->{context} = undef;
}


sub new {
    my ($class, $context) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{context} = $context;
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileFactory::SINGLETON;
}


# throws Exception
sub isFile {
    my ($self, $path) = @_;
        try {
            $self->{context}->openFileInput($path);
            return 1;
        } catch ($e) {
            return 0;
        }
}


sub getContext {
    my ($self) = @_;
        return $self->{context};
}


# throws Exception
sub getFile {
    my ($self, $filePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileFromRawPath($filePath);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $file, $childFilePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileWithChild($file, $childFilePath);
}

# use java::io::FileNotFoundException;
use android::content::Context;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::io::file::AbFile;

1;

