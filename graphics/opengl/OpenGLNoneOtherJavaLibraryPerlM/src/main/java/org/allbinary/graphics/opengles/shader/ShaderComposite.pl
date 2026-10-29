# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::opengles::shader::ShaderComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{disableProgramShaderOpenGLProcessor} = undef;
    $self->{requiresOpenGLVersion} = undef;
    $self->{shaderArray} = undef;
    $self->{shaderInitializer} = undef;
    $self->{compositeShaderUpdater} = undef;
    $self->{modelViewProjection} = undef;
    $self->{colorOpenGLProcessor} = undef;
    $self->{vertexOpenGLProcessor} = undef;
    $self->{useProgramShaderOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{shaderMatrixOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{colorEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{normalEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{vertexEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{textureEnableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{colorDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{normalDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{vertexDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{textureDisableVertexAttribArrayOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    $self->{uniformLightPositionOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformLightColorOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformCameraPositionOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{uniformTextureUnitOpenGLProcessor} = 'org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor'->getInstance();
    $self->{programHandle} = 0;
}


sub new {
    my ($class, $requiresOpenGLVersion, $shaderArray, $compositeShaderUpdater, $shaderInitializer, $modelViewProjection, $colorOpenGLProcessor, $vertexOpenGLProcessor, $disableProgramShaderOpenGLProcessor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{requiresOpenGLVersion} = $requiresOpenGLVersion;
        $self->{shaderArray} = $shaderArray;
        $self->{shaderInitializer} = $shaderInitializer;
        $self->{compositeShaderUpdater} = $compositeShaderUpdater;
        $self->{modelViewProjection} = $modelViewProjection;
        $self->{colorOpenGLProcessor} = $colorOpenGLProcessor;
        $self->{vertexOpenGLProcessor} = $vertexOpenGLProcessor;
        $self->{disableProgramShaderOpenGLProcessor} = $disableProgramShaderOpenGLProcessor;
    return $self;
}


sub init {
    my ($self, $gl) = @_;
        $self->{programHandle} = $self->{shaderInitializer}->init($gl, $self->{shaderArray}, 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance());
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::graphics::opengles::NullOpenGLProcessorFactory;
use org::allbinary::graphics::opengles::OpenGLProcessor;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::opengles::shader::NullOpenGLTextureProcessor;

1;

