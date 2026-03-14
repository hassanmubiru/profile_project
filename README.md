# Django Profile Project - Python Basics Learning Dashboard

A complete, production-ready Django website that teaches Python basics (variables, loops, functions) while demonstrating real-world web development concepts.

**Status**: ✅ 100% Working & Copy-Paste Ready

---

## 📚 What This Project Teaches

This project demonstrates:

### 1. **Python Variables** 
- Data storage in Python (lists, dictionaries)
- String formatting with f-strings
- Data types (int, string, list, dict, JSONField)
- Examples in: `views.py` (lines 30-55), `models.py` (lines 15-30)

### 2. **Python Loops**
- `for` loop with `enumerate()` - demonstrated in `views.py` (lines 57-68)
- Django template `{% for %}` loops - in `profile.html` (line 127)
- QuerySet iteration in Django ORM

### 3. **Python Functions**
- View functions with `@login_required` decorator
- Function parameters and return values
- Context passing to templates

---

## 📁 Project Structure

```
profile_project/
├── manage.py                           # Django management script
├── requirements.txt                    # Python dependencies
├── setup.sh                           # Automated setup script
├── README.md                          # This file
├── .gitignore                         # Git ignore rules
│
├── profile_project/                   # Main Django project
│   ├── __init__.py
│   ├── settings.py                   # Django configuration
│   ├── urls.py                       # Main URL routing
│   ├── asgi.py                       # ASGI application
│   └── wsgi.py                       # WSGI application
│
└── profile_app/                      # App with profile features
    ├── models.py                     # Profile model (VARIABLES example)
    ├── views.py                      # Profile view (VARIABLES & LOOPS example)
    ├── urls.py                       # App URL routing
    ├── admin.py                      # Django admin configuration
    ├── apps.py                       # App configuration
    ├── __init__.py
    ├── migrations/
    │   ├── __init__.py
    │   └── 0001_initial.py          # Database schema
    └── templates/
        └── profile.html              # UI template (LOOPS example)
```

---

## 🚀 Quick Start (5 Minutes)

### Option 1: Automated Setup (Recommended)

```bash
cd profile_project
chmod +x setup.sh
./setup.sh
```

Follow the prompts to create a superuser account.

### Option 2: Manual Setup

```bash
# Navigate to project
cd profile_project

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create database and apply migrations
python manage.py migrate

# Create superuser (admin account)
python manage.py createsuperuser
# Follow prompts:
# Username: admin
# Email: admin@example.com
# Password: (enter password, e.g., password123)

# Start development server
python manage.py runserver
```

---

## 📖 Usage

### 1. **Create a User Profile**

First, add profile data through the Django Admin:

```
1. Visit: http://localhost:8000/admin/
2. Login with your superuser credentials
3. Click "Profiles" → "Add Profile"
4. Select a user, add age, bio, and topics
5. Click "Save"
```

### 2. **View User Profile**

```
1. Visit: http://localhost:8000/profile/
2. You'll be redirected to login
3. Login with your superuser account
4. See the profile with today's topics displayed
```

### 3. **Explore the Admin Panel**

```
Visit: http://localhost:8000/admin/
Edit profiles directly here
```

---

## 🎯 Learning Focus: Code Examples

### EXAMPLE 1: Variables in Python

**Location**: [profile_app/views.py](profile_app/views.py#L30-L55)

```python
def profile_view(request):
    # VARIABLE EXAMPLE 1: Current user object
    current_user = request.user
    
    # VARIABLE EXAMPLE 2: Get profile from database
    user_profile = Profile.objects.get(user=current_user)
    
    # VARIABLE EXAMPLE 3: List of topics (Python list data structure)
    today_topics = ["variables", "loops", "functions"]
    
    # VARIABLE EXAMPLE 4: User info dictionary
    user_data = {
        "username": current_user.username,
        "email": current_user.email,
        "first_name": current_user.first_name or "Not set",
    }
    
    # VARIABLE: Store value for use in template
    total_topics = len(today_topics)  # Built-in len() function
```

**Concepts Explained**:
- Variables store data in memory
- Different data types: string, object, list, dictionary
- Variables can be passed to templates via context

---

### EXAMPLE 2: Loops in Python

**Location**: [profile_app/views.py](profile_app/views.py#L57-L68)

```python
def profile_view(request):
    today_topics = ["variables", "loops", "functions"]
    
    # LOOP: Process each topic
    processed_topics = []
    
    # for loop with enumerate() - provides both index and value
    for index, topic in enumerate(today_topics, start=1):
        # Inside loop body:
        # - index: 1, 2, 3 (current position)
        # - topic: "variables", "loops", "functions" (current item)
        
        formatted_topic = f"Lesson {index}: {topic.upper()}"
        processed_topics.append(formatted_topic)
    
    # Result:
    # processed_topics = [
    #     "Lesson 1: VARIABLES",
    #     "Lesson 2: LOOPS",
    #     "Lesson 3: FUNCTIONS"
    # ]
```

**Concepts Explained**:
- `for` loop iterates through a list, one item at a time
- `enumerate()` provides both the index and value
- Loop body executes once for each item
- List `.append()` adds items to the list

---

### EXAMPLE 3: Loops in Django Templates

**Location**: [profile_app/templates/profile.html](profile_app/templates/profile.html#L127-L145)

```html
<!-- HTML template file (Jinja2 template language) -->

<!-- This loop runs for each item in today_topics -->
<ul class="topics-list">
    {% for topic in today_topics %}
        <!-- 
        Loop iteration variables:
        - forloop.counter: 1, 2, 3... (current position)
        - topic: "variables", "loops", "functions" (current item)
        - forloop.first / forloop.last: True if first/last iteration
        -->
        <li class="topic-item">
            <span class="topic-number">{{ forloop.counter }}</span>
            <span class="topic-name">{{ topic|upper }}</span>
        </li>
    {% endfor %}
</ul>

<!-- Output:
<li class="topic-item">
    <span class="topic-number">1</span>
    <span class="topic-name">VARIABLES</span>
</li>
<li class="topic-item">
    <span class="topic-number">2</span>
    <span class="topic-name">LOOPS</span>
</li>
<li class="topic-item">
    <span class="topic-number">3</span>
    <span class="topic-name">FUNCTIONS</span>
</li>
-->
```

**Concepts Explained**:
- Django templates use `{% for %}` syntax (similar to Python)
- Variables in templates use `{{ variable }}` syntax
- Filters like `|upper` transform data
- Built-in `forloop` variable provides loop metadata

---

### EXAMPLE 4: Database Model (Variables in OOP)

**Location**: [profile_app/models.py](profile_app/models.py)

```python
class Profile(models.Model):
    # These are class variables that define the database schema
    
    # VARIABLE: Foreign key - links to User model
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    
    # VARIABLE: Integer field for age
    age = models.IntegerField(default=0)
    
    # VARIABLE: Text field for bio
    bio = models.TextField(default="", blank=True)
    
    # VARIABLE: JSON field for list of topics
    topics = JSONField(default=list, blank=True)
    
    # VARIABLE: Timestamps for audit trail
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
```

**Concepts Explained**:
- Models define database tables
- Variable fields map to database columns
- Data types determine storage format
- Default values provide initialization

---

## 🔑 Key Files Explained

### profile_app/models.py
Contains the `Profile` model which:
- Extends Django's User model with additional fields
- Uses JSONField to store the topics list
- Demonstrates data structure definition

### profile_app/views.py  
Contains the `profile_view()` function which:
- Uses `@login_required` decorator to protect the view
- Retrieves user data from database
- Creates variables with sample data
- Uses Python `for` loop to process topics
- Passes variables to template via context dictionary

### profile_app/templates/profile.html
The HTML template that:
- Displays user information using template variables
- Uses Django's `{% for %}` loop to display topics
- Includes explanatory code comments
- Shows Python loop examples in code blocks
- Provides clickable links to admin panel

### profile_project/settings.py
Django configuration file:
- Database setup (SQLite for development)
- Installed apps including `profile_app`
- Email configuration
- Static files settings

### profile_project/urls.py
URL routing:
- Maps `/admin/` to Django admin
- Includes `profile_app` URLs
- Routes `/profile/` to profile view

---

## 🧪 Testing the Application

### Test 1: Create Profile Data
```bash
# In admin panel:
1. Go to http://localhost:8000/admin/
2. Click: Profiles → Add Profile
3. Fill in:
   - User: admin
   - Age: 25
   - Bio: "Learning Django and Python"
   - Topics: ["variables", "loops", "functions"]
4. Click: Save
```

### Test 2: View Profile Page
```bash
1. Visit: http://localhost:8000/profile/
2. You should see:
   - Your username
   - Your age
   - Your bio
   - The topics list with loop counter (1, 2, 3)
   - Code examples showing how loops work
```

### Test 3: Admin View All Profiles
```bash
1. Visit: http://localhost:8000/admin/profile_app/profile/
2. See all profiles listed
3. Click one to edit
```

---

## 💻 Technical Stack

- **Framework**: Django 4.2.0
- **Database**: SQLite3 (ideal for development/learning)
- **Template Engine**: Django Template Language (DTL/Jinja2)
- **Authentication**: Django built-in auth system
- **Python Version**: 3.8+

---

## 📝 Code Comments & Learning

Every file includes detailed comments explaining:
- What each line does
- Why we use certain patterns
- How variables and loops work
- Django-specific concepts

Look for comments marked with:
- `# VARIABLE EXAMPLE N:` - Shows variable usage
- `# LOOP EXAMPLE N:` - Shows loop usage
- `# Variables:` - Lists variables used in a function
- `# Demonstrates:` - Lists learning concepts

---

## 🐛 Troubleshooting

### Issue: "No module named 'django'"
```bash
# Solution: Activate virtual environment
source venv/bin/activate
pip install -r requirements.txt
```

### Issue: "Table doesn't exist" error
```bash
# Solution: Run migrations
python manage.py migrate
```

### Issue: Login redirects infinitely
```bash
# Solution: Create superuser
python manage.py createsuperuser
# Then login via /admin/ first
```

### Issue: Can't access /profile/
```bash
# Solution: 
# 1. Make sure you're logged in
# 2. Visit http://localhost:8000/admin/ and login first
# 3. Then visit http://localhost:8000/profile/
```

### Issue: "Permission denied" for setup.sh
```bash
# Solution: Make it executable
chmod +x setup.sh
```

---

## 🎓 What You'll Learn

By studying this project:

1. **Python Basics**
   - Variables and data types
   - Lists and dictionaries
   - For loops with enumerate()
   - String formatting (f-strings)

2. **Django Framework**
   - Models and database schema
   - Views and request handling
   - URL routing
   - Admin panel customization
   - Template system and loops

3. **Web Development**
   - User authentication
   - Database queries
   - HTML/CSS templating
   - Request-response cycle

4. **Python Best Practices**
   - Code organization
   - Documentation with docstrings
   - Exception handling (try/except)
   - Decorators (@login_required)

---

## 📚 Additional Resources

- [Django Official Documentation](https://docs.djangoproject.com/)
- [Python For Loop Documentation](https://docs.python.org/3/tutorial/controlflow.html#for-statements)
- [Python Variables & Data Types](https://docs.python.org/3/tutorial/introduction.html)
- [Django Models](https://docs.djangoproject.com/en/stable/topics/db/models/)
- [Django Views](https://docs.djangoproject.com/en/stable/topics/http/views/)

---

## 📄 License

This project is provided as-is for educational purposes.

---

## ✅ Verification Checklist

- [x] Project structure created
- [x] All models defined with comments
- [x] Views demonstrate variables and loops
- [x] URLs properly configured
- [x] Template shows loops and variables
- [x] Admin panel configured
- [x] Migrations created
- [x] Setup script included
- [x] Documentation complete
- [x] 100% ready to run

---

## 🎯 Next Steps

1. **Run the setup**: `./setup.sh`
2. **Create profile data**: Visit admin panel
3. **View profile page**: Visit `/profile/`
4. **Study the code**: Read through commented code
5. **Modify and experiment**: Change values, add features

---

**Happy Learning! 🚀**

Questions? Review the code comments in each file - they explain everything!
