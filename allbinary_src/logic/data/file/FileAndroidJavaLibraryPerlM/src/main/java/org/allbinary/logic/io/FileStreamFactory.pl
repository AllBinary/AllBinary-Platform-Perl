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

package org::allbinary::logic::io::FileStreamFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{context} = undef;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::logic::io::FileStreamFactory::SINGLETON == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::logic::io::FileStreamFactory::SINGLETON = 'org::allbinary::logic::io::FileStreamFactory'->new('org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext());
        }
        return $org::allbinary::logic::io::FileStreamFactory::SINGLETON;
}


sub new {
    my ($class, $context) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{context} = $context;
    return $self;
}


# throws Exception
sub getFileInputStreamInstance {
    my ($self, $path, $fileName) = @_;
        return 'org::allbinary::logic::io::AbFileInputStream'->new($self->getContext()->openFileInput($fileName));
}


# throws Exception
sub getFileOutputStreamInstance {
    my ($self, $path, $fileName) = @_;
        my $context = $self->getContext();
        $context->deleteFile($fileName);
        return 'org::allbinary::logic::io::AbFileOutputStream'->new($context->openFileOutput($fileName, 0));
}


# throws Exception
sub delete {
    my ($self, $path, $fileName) = @_;
        $self->getContext()->deleteFile($fileName);
}


sub getContext {
    my ($self) = @_;
        return $self->{context};
}

use android::content::Context;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileOutputStream;

1;

