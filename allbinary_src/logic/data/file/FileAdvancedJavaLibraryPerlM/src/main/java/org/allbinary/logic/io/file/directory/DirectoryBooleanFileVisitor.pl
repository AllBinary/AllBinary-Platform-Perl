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

package org::allbinary::logic::io::file::directory::DirectoryBooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::VisitorInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        return $self->visit($anyType);
}


# Java overloaded method: Perl keeps the last definition
sub visit {
    my ($self, $file) = @_;
        if ($file->isDirectory()) {
            return 1;
        }
        return 0;
}

use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::util::visitor::VisitorInterface;

1;

