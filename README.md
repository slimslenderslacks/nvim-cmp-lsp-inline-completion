# Building

```sh
# docker:command=build
make
```

## Example payload to complete function

```
{:completion_context {:triggerKind 1}                                                                                                                                                                                
 :context {:aborted true                                                                                                                                                                                                                
           :bufnr 1                                                                                                                                                                                                                     
           :cache {:entries {"get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):# a" 3                                                                                                                             
                             "get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):# a" 3}}                                                                                                                                                 
           :cursor {:character 3 :col 4 :line 9 :row 10}                                                                                                                                                                                
           :cursor_after_line ""                                                                                                                                                                                                        
           :cursor_before_line "# a"                                                                                                                                                                                                    
           :cursor_line "# a"                                                                                                                                                                                                           
           :filetype "markdown"                                                                                                                                                                                                         
           :id 33                                                                                                                                                                                                                       
           :option {:reason "auto"}                                                                                                                                                                                                     
           :prev_context {:aborted true                                                                                                                                                                                                 
                          :bufnr 1                                                                                                                                                                                                      
                          :cursor {:character 2 :col 3 :line 9 :row 10}                                                                                                                                                                 
                          :cursor_after_line ""                                                                                                                                                                                         
                          :cursor_before_line "# "                                                                                                                                                                                      
                          :cursor_line "# "                                                                                                                                                                                             
                          :filetype "markdown"                                                                                                                                                                                          
                          :id 32                                                                                                                                                                                                        
                          :option {}                                                                                                                                                                                                    
                          :time 8324329295}                                                                                                                                                                                             
           :time 8324329306}                                                                                                                                                                                                            
 :name "lsp-inline-completions"                                                                                                                                                                                                         
 :offset 3                                                                                                                                                                                                                              
 :option {}}
```
