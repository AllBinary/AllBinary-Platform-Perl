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

package org::allbinary::logic::io::file::visitor::ExcludeFileExtensionsBooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::file::visitor::BooleanFileVisitor';



sub new {
    my ($class, $filterStringBasicArrayList) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
        # super(...) made $self above
    return $self;
}


sub visit {
    my ($self, $file) = @_;
        if ($self->getFilterStringBasicArrayList()->size() == 0) {
            return 1;
        }
        return $self->SUPER::visit($file);
}


# Java overloaded method: Perl keeps the last definition
sub visit {
    my ($self, $file, $fileNameString) = @_;
        my $fileNameAndExtension = $file->getPath();
        if (length($fileNameAndExtension) > length($fileNameString)) {
            my $startIndex = length($fileNameAndExtension) - length($fileNameString);
            my $fileName = substr($fileNameAndExtension, $startIndex);
            if (($fileName cmp $fileNameString) == 0) {
                return 0;
            }
        }
        return 1;
}

use org::allbinary::logic::io::file::AbFile;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::io::file::visitor::BooleanFileVisitor;

1;

