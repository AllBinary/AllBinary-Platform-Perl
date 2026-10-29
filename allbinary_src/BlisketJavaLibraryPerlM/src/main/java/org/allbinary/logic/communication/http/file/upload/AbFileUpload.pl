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

package org::allbinary::logic::communication::http::file::upload::AbFileUpload;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::apache::commons::fileupload::FileUpload';



sub new {
    my ($class, $fileItemFactory) = @_;
    my $self = $class->SUPER::new($fileItemFactory);
        # super(...) made $self above
    return $self;
}


# throws FileUploadException, IOException
sub getItemIterator {
    my ($self, $request) = @_;
        return $self->SUPER::getItemIterator('org::apache::commons::fileupload::servlet::ServletRequestContext'->new($request));
}

# use java::io::IOException;
# use javax::servlet::http::HttpServletRequest;
use org::apache::commons::fileupload::FileItemFactory;
use org::apache::commons::fileupload::FileItemIterator;
use org::apache::commons::fileupload::FileUpload;
use org::apache::commons::fileupload::FileUploadException;
use org::apache::commons::fileupload::servlet::ServletRequestContext;

1;

