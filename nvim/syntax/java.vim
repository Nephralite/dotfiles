"dracula
let pink = "#ffb86c"
let yellow = "#f1fa8c"
let cyan = "#8be9fd" 
let green = "#50fa7b"
let purple = "#bd93f9"
let orange = "#ffb86c"
let red = "#ff5555"
let white = "#f8f8f2"

" cterm
" pink 5
" yellow 3
" cyan 6
" green 2
" purple 4
" orange ?
" red 1
" white 7
" black 0
" grey 8

" leftover
syn match main "\w"
execute "highlight main ctermfg=7 guifg=".white

" numbers
syn match posNum "\d"
execute "highlight posNum ctermfg=4 guifg=".purple

" method names
syn match class ".\w*\((\)\@="
execute "highlight class ctermfg=7 guifg=".white
           
" leftover with numbers
syn match main "\v(\a)\w*\d="                    
execute "highlight main ctermfg=7 guifg=".white

" imported packages                                             
syn match importName "\v(^import\s+)@<=.*;"                      
execute "highlight importName ctermfg=3 guifg=".yellow

" import                                             
syn match importWord "import "                      
execute "highlight importWord ctermfg=6 guifg=".cyan

" leftover with numbers                                             
syn match packageName "\v(^package\s+)@<=.*;"                      
execute "highlight packageName ctermfg=3 guifg=".yellow

" leftover with numbers                                             
syn match packageWord "package "                      
execute "highlight packageWord ctermfg=6 guifg=".cyan

" int, char, double ect
execute "highlight javaType ctermfg=4 guifg=".purple

" static, throws
execute "highlight javaStorageClass ctermfg=5 guifg=".pink

" class name
syntax match ClassName display '\<\([A-Z][a-z0-9]*\)\+\>'
syntax match ClassName display '\.\@<=\*'
highlight link ClassName Identifier
execute "highlight ClassName ctermfg=7 guifg=".white

" Output for some reason
syn match print " System.out."
execute "highlight print ctermfg=7 guifg=".white

" Objects (change this
syn match JavaClassDec12 " class\> "
execute "highlight JavaClassDec12 ctermfg=5 guifg=".pink

" package
execute "highlight javaExternal ctermfg=6  guifg=".cyan

"if else switch
execute "highlight javaConditional ctermfg=5  guifg=".pink

"while for do 
execute "highlight javaRepeat ctermfg=5  guifg=".pink

"true flase
execute "highlight javaBoolean ctermfg=4  guifg=".purple

" null
syn match null "\v[ =]null[; ]"
execute "highlight null ctermfg=4  guifg=".purple

" this super
execute "highlight javaTypedef ctermfg=5  guifg=".pink
		
" var new instanceof
execute "highlight javaOperator ctermfg=5  guifg=".pink
	
" return
execute "highlight javaStatement ctermfg=2  guifg=".green

" static synchronized transient volatile final strictfp serializable
execute "highlight javaStorageClass ctermfg=5  guifg=".pink

"throw try catch finally
execute "highlight javaExceptions ctermfg=5  guifg=".pink

" assert
execute "highlight javaAssert ctermfg=5  guifg=".pink

" synchronized throws
execute "highlight javaMethodDecl ctermfg=5  guifg=".pink

" extends implements interface
execute "highlight javaClassDecl ctermfg=6  guifg=".cyan

" break continue skipwhite
execute "highlight javaBranch ctermfg=2  guifg=".green

" public protected private abstract
execute "highlight javaScopeDecl ctermfg=5  guifg=".pink


""""""""""""""""""""""""""""""""""""""'
" java 9...
" module transitive
execute "highlight javaModuleStorageClass ctermfg=5  guifg=".pink


" open requires exports opens uses provides 
execute "highlight javaModuleStmt ctermfg=6  guifg=".cyan


" to with
execute "highlight javaModuleExternal ctermfg=5  guifg=".pink


"""""""""""""""""""""""""""""""""""""""""
" lambda
execute "highlight javaLambdaDef ctermfg=2  guifg=".green


""""""""""""""""""""""""""""""""""""""""""
" clone equals finalize getClass hashCode
" notify notifyAll toString wait
execute "highlight javaLangObject ctermfg=5  guifg=".pink

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syn match classWord "class "                      
" execute "highlight classWord ctermfg=5 guifg=".pink


